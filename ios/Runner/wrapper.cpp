//
//  wrapper.cpp
//  Runner
//
//  Created by Phuong Lam on 5/9/21.
//

#include <stdint.h>
#include <stdio.h>
#include "bls.hpp"

#define PRIVATE_KEY_LEN 32
#define PUBLIC_KEY_LEN 48
#define SIGNATURE_LEN 96

using namespace std;

void printKey(vector<uint8_t> key) {
    for (int i = 0; i < key.size(); i++) {
        cout << unsigned(key[i]) << ", ";
    }
    cout << endl;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
uint8_t* key_gen(uint8_t* seedBytes) {
    std::vector<uint8_t> seed(seedBytes, seedBytes + 32);

    bls::PrivateKey sk = bls::AugSchemeMPL().KeyGen(seed);
    bls::G1Element pk = sk.GetG1Element();
    
    cout << bls::Util::HexStr(sk.Serialize()) << endl;
    cout << bls::Util::HexStr(pk.Serialize()) << endl;
    
    vector<uint8_t> data;
    data.push_back(0);
    
    vector<uint8_t> skB = sk.Serialize();
    vector<uint8_t> pkB = pk.Serialize();
    data.insert(data.end(), skB.begin(), skB.end());
    data.insert(data.end(), pkB.begin(), pkB.end());

    uint8_t* key = static_cast<uint8_t*>(malloc(81));
    copy(data.begin(), data.end(), key);
    return key;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
uint8_t* sign(uint8_t* key, uint8_t* message, size_t messageLen) {
    
    cout << bls::Util::HexStr(key, 32) << endl;
    cout << bls::Util::HexStr(key, 32) << endl;

    bls::Bytes keyBytes = bls::Bytes(key, PRIVATE_KEY_LEN);
    bls::PrivateKey sk = bls::PrivateKey::FromBytes(keyBytes);
    
    bls::G2Element signature = bls::AugSchemeMPL().Sign(sk, bls::Bytes(message, messageLen));
    vector<uint8_t> s = signature.Serialize();
    
    uint8_t* sign = static_cast<uint8_t*>(malloc(SIGNATURE_LEN));
    
    copy(s.begin(), s.end(), sign);
    
    return sign;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int8_t verify_key(uint8_t *key) {
    bls::Bytes keyBytes = bls::Bytes(key, PRIVATE_KEY_LEN);
    bls::PrivateKey sk = bls::PrivateKey::FromBytes(keyBytes);
    bls::G1Element pk = sk.GetG1Element();

    vector<uint8_t> message = {1, 2, 3, 4, 5};  // Message is passed in as a byte vector
    bls::G2Element signature = bls::AugSchemeMPL().Sign(sk, message);

    // Verify the signature
    if(bls::AugSchemeMPL().Verify(pk, message, signature)) {
        return 0;
    } else {
        return 1;
    }
}

extern "C" __attribute__((visibility("default"))) __attribute__((used))
uint8_t verify_signature(uint8_t *key, uint8_t *signature, uint8_t *message, size_t messageLen) {
    bls::G1Element pk = bls::G1Element().FromBytes(bls::Bytes(key, PUBLIC_KEY_LEN));
    bls::G2Element s = bls::G2Element().FromBytes(bls::Bytes(signature, SIGNATURE_LEN));
    bool success = bls::AugSchemeMPL().Verify(pk, bls::Bytes(message, messageLen), s);
    return success ? 0 : 1;
}
