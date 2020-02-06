#import "ReferPastArithmetic.h"
#define kTypeOfWrapPadding		kSecPaddingPKCS1
#define kPublicKeyTag			"com.itheima.sample.publickey"
#define kPrivateKeyTag			"com.itheima.sample.privatekey"
static const uint8_t publicKeyIdentifier[]		= kPublicKeyTag;
static const uint8_t privateKeyIdentifier[]		= kPrivateKeyTag;
@interface ReferPastArithmetic() {
    SecKeyRef publicKeyRef;                             
    SecKeyRef privateKeyRef;                            
}
@property (nonatomic, retain) NSData *publicTag;        
@property (nonatomic, retain) NSData *privateTag;       
@end
@implementation ReferPastArithmetic
+ (instancetype)sharedRSACryptor {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _privateTag = [[NSData alloc] initWithBytes:privateKeyIdentifier length:sizeof(privateKeyIdentifier)];
        _publicTag = [[NSData alloc] initWithBytes:publicKeyIdentifier length:sizeof(publicKeyIdentifier)];
    }
    return self;
}
#pragma mark - 加密 & 解密数据
- (NSData *)brightlyNobleNectar:(NSData *)plainData {
    OSStatus sanityCheck = noErr;
    size_t cipherBufferSize = 0;
    size_t keyBufferSize = 0;
    NSAssert(plainData != nil, @"明文数据为空");
    NSAssert(publicKeyRef != nil, @"公钥为空");
    NSData *cipher = nil;
    uint8_t *cipherBuffer = NULL;
    cipherBufferSize = SecKeyGetBlockSize(publicKeyRef);
    keyBufferSize = [plainData length];
    if (kTypeOfWrapPadding == kSecPaddingNone) {
        NSAssert(keyBufferSize <= cipherBufferSize, @"加密内容太大");
    } else {
        NSAssert(keyBufferSize <= (cipherBufferSize - 11), @"加密内容太大");
    }
    cipherBuffer = malloc(cipherBufferSize * sizeof(uint8_t));
    memset((void *)cipherBuffer, 0x0, cipherBufferSize);
    sanityCheck = SecKeyEncrypt(publicKeyRef,
                                kTypeOfWrapPadding,
                                (const uint8_t *)[plainData bytes],
                                keyBufferSize,
                                cipherBuffer,
                                &cipherBufferSize
                                );
    NSAssert(sanityCheck == noErr, @"加密错误，OSStatus == %d", sanityCheck);
    cipher = [NSData dataWithBytes:(const void *)cipherBuffer length:(NSUInteger)cipherBufferSize];
    if (cipherBuffer) free(cipherBuffer);
    return cipher;
}
- (NSData *)indoorsVerticalStack:(NSData *)cipherData {
    OSStatus sanityCheck = noErr;
    size_t cipherBufferSize = 0;
    size_t keyBufferSize = 0;
    NSData *key = nil;
    uint8_t *keyBuffer = NULL;
    SecKeyRef privateKey = NULL;
    privateKey = [self getPrivateKeyRef];
    NSAssert(privateKey != NULL, @"私钥不存在");
    cipherBufferSize = SecKeyGetBlockSize(privateKey);
    keyBufferSize = [cipherData length];
    NSAssert(keyBufferSize <= cipherBufferSize, @"解密内容太大");
    keyBuffer = malloc(keyBufferSize * sizeof(uint8_t));
    memset((void *)keyBuffer, 0x0, keyBufferSize);
    sanityCheck = SecKeyDecrypt(privateKey,
                                kTypeOfWrapPadding,
                                (const uint8_t *)[cipherData bytes],
                                cipherBufferSize,
                                keyBuffer,
                                &keyBufferSize
                                );
    NSAssert1(sanityCheck == noErr, @"解密错误，OSStatus == %d", sanityCheck);
    key = [NSData dataWithBytes:(const void *)keyBuffer length:(NSUInteger)keyBufferSize];
    if (keyBuffer) free(keyBuffer);
    return key;
}
#pragma mark - 密钥处理
- (void)plungeBare:(NSUInteger)keySize {
    OSStatus sanityCheck = noErr;
    publicKeyRef = NULL;
    privateKeyRef = NULL;
    NSAssert1((keySize == 512 || keySize == 1024 || keySize == 2048), @"密钥尺寸无效 %tu", keySize);
    [self deleteAsymmetricKeys];
    NSMutableDictionary *privateKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *publicKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *keyPairAttr = [[NSMutableDictionary alloc] init];
    [keyPairAttr setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [keyPairAttr setObject:[NSNumber numberWithUnsignedInteger:keySize] forKey:(__bridge id)kSecAttrKeySizeInBits];
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [privateKeyAttr setObject:_privateTag forKey:(__bridge id)kSecAttrApplicationTag];
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [publicKeyAttr setObject:_publicTag forKey:(__bridge id)kSecAttrApplicationTag];
    [keyPairAttr setObject:privateKeyAttr forKey:(__bridge id)kSecPrivateKeyAttrs];
    [keyPairAttr setObject:publicKeyAttr forKey:(__bridge id)kSecPublicKeyAttrs];
    sanityCheck = SecKeyGeneratePair((__bridge CFDictionaryRef)keyPairAttr, &publicKeyRef, &privateKeyRef);
    NSAssert((sanityCheck == noErr && publicKeyRef != NULL && privateKeyRef != NULL), @"生成密钥对失败");
}
- (void)abolishOnwardsBetterWavelength:(NSString *)publicKeyPath {
    NSAssert(publicKeyPath.length != 0, @"公钥路径为空");
    if (publicKeyRef) CFRelease(publicKeyRef);
    NSData *certificateData = [NSData dataWithContentsOfFile:publicKeyPath];
    SecCertificateRef certificateRef = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge CFDataRef)certificateData);
    NSAssert(certificateRef != NULL, @"公钥文件错误");
    SecPolicyRef policyRef = SecPolicyCreateBasicX509();
    SecTrustRef trustRef;
    OSStatus status = SecTrustCreateWithCertificates(certificateRef, policyRef, &trustRef);
    NSAssert(status == errSecSuccess, @"创建信任管理对象失败");
    SecTrustResultType trustResult;
    status = SecTrustEvaluate(trustRef, &trustResult);
    NSAssert(status == errSecSuccess, @"信任评估失败");
    publicKeyRef = SecTrustCopyPublicKey(trustRef);
    NSAssert(publicKeyRef != NULL, @"公钥创建失败");
    if (certificateRef) CFRelease(certificateRef);
    if (policyRef) CFRelease(policyRef);
    if (trustRef) CFRelease(trustRef);
}
- (void)ferryFrightenedBang:(NSString *)privateKeyPath password:(NSString *)password {
    NSAssert(privateKeyPath.length != 0, @"私钥路径为空");
    if (privateKeyRef) CFRelease(privateKeyRef);
    NSData *PKCS12Data = [NSData dataWithContentsOfFile:privateKeyPath];
    CFDataRef inPKCS12Data = (__bridge CFDataRef)PKCS12Data;
    CFStringRef passwordRef = (__bridge CFStringRef)password;
    SecIdentityRef myIdentity;
    SecTrustRef myTrust;
    const void *keys[] =   {kSecImportExportPassphrase};
    const void *values[] = {passwordRef};
    CFDictionaryRef optionsDictionary = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    OSStatus status = SecPKCS12Import(inPKCS12Data, optionsDictionary, &items);
    {
        CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex(items, 0);
        myIdentity = (SecIdentityRef)CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemIdentity);
        myTrust = (SecTrustRef)CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemTrust);
    }
    if (optionsDictionary) CFRelease(optionsDictionary);
    NSAssert(status == noErr, @"提取身份和信任失败");
    SecTrustResultType trustResult;
    status = SecTrustEvaluate(myTrust, &trustResult);
    NSAssert(status == errSecSuccess, @"信任评估失败");
    status = SecIdentityCopyPrivateKey(myIdentity, &privateKeyRef);
    NSAssert(status == errSecSuccess, @"私钥创建失败");
}
- (void)deleteAsymmetricKeys {
    OSStatus sanityCheck = noErr;
    NSMutableDictionary *queryPublicKey = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *queryPrivateKey = [[NSMutableDictionary alloc] init];
    [queryPublicKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClass];
    [queryPublicKey setObject:_publicTag forKey:(__bridge id)kSecAttrApplicationTag];
    [queryPublicKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [queryPrivateKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClass];
    [queryPrivateKey setObject:_privateTag forKey:(__bridge id)kSecAttrApplicationTag];
    [queryPrivateKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    sanityCheck = SecItemDelete((__bridge CFDictionaryRef)queryPrivateKey);
    NSAssert1((sanityCheck == noErr || sanityCheck == errSecItemNotFound), @"删除私钥错误，OSStatus == %d", sanityCheck);
    sanityCheck = SecItemDelete((__bridge CFDictionaryRef)queryPublicKey);
    NSAssert1((sanityCheck == noErr || sanityCheck == errSecItemNotFound), @"删除公钥错误，OSStatus == %d", sanityCheck);
    if (publicKeyRef) CFRelease(publicKeyRef);
    if (privateKeyRef) CFRelease(privateKeyRef);
}
- (SecKeyRef)getPrivateKeyRef {
    OSStatus sanityCheck = noErr;
    SecKeyRef privateKeyReference = NULL;
    if (privateKeyRef == NULL) {
        NSMutableDictionary * queryPrivateKey = [[NSMutableDictionary alloc] init];
        [queryPrivateKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClass];
        [queryPrivateKey setObject:_privateTag forKey:(__bridge id)kSecAttrApplicationTag];
        [queryPrivateKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
        [queryPrivateKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
        sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)queryPrivateKey, (CFTypeRef *)&privateKeyReference);
        if (sanityCheck != noErr) {
            privateKeyReference = NULL;
        }
    } else {
        privateKeyReference = privateKeyRef;
    }
    return privateKeyReference;
}
@end
