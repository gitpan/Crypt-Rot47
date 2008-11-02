# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Data-Formatter-Text.t'

#########################

use Test::More tests => 4;
BEGIN { use_ok('Crypt::Rot47') };

# Test that the appropriate methods exist
can_ok('Crypt::Rot47', 'new', 'encrypt', 'decrypt', 'rot47');

my $plaintext = 'Hello world';
my $cipher = Crypt::Rot47->new();

# Test that text is changed by encryption
my $ciphertext = $cipher->encrypt($plaintext);
isnt($ciphertext, $plaintext, 'encrypt scrambles text');

# Test that the text is unscrambed by decryption
my $decryptedText = $cipher->decrypt($ciphertext);
is($decryptedText, $plaintext, 'decrypt unscrambles scrambled text');


