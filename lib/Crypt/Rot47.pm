package Crypt::Rot47;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT_OK = qw(rot47);

our $VERSION = 0.03;

sub new
{
    my ($class) = @_;

    # This object is basically nothing,
    # and I provide an OOP interface just
    # to be API-consistent with other
    # similar Crypt:: modules.
    return bless [], $class;
}

sub encrypt
{
    return rot47($_[1]);
}

sub decrypt
{
    return rot47($_[1]);
}

sub rot47
{
    my ($text) = @_;

    # Rotate every character from decimal 33 '!' 
    # through 126 '~' by 47 positions
    $text =~ tr/!-~/P-~!-O/;

    return $text;
}

1;

=head1 NAME

Crypt::Rot47 - Perl extension for encrypting and decrypting ASCII text using the Rot47 substitution cipher. 

=head1 SYNOPSIS

  # Object-oriented interface
  use Crypt::Rot47; 

  my $cipher = new Crypt::Rot47();
  my $ciphertext = $cipher->encrypt('Shhh... this is a secret message');

  print "$ciphertext\n";     # Prints "$999]]] E9:D :D 2 D64C6E >6DD286"

  my $plaintext = $cipher->decrypt($ciphertext);

  print "$plaintext\n";        # Prints "Shhh... this is a secret message"

  # Simpler non-OOP interface
  use Crypt::Rot47 qw(rot47);

  my $ciphertext = rot47('Shhh... this is a secret message');
  my $plaintext  = rot47($ciphertext);

=head1 DESCRIPTION

A module that applies the Rot47 substitution cipher to text to encrypt or
decrypt it.

=head2 Methods

=over 4

=item I<PACKAGE>->new()

  use Crypt::Rot47;
  my $cipher = new Crypt::Rot47();

Returns a newly created C<Crypt::Rot47> object.

=item I<$OBJ>->encrypt(I<SCALAR>)

  my $cipherText = $cipher->encrypt('Hello, world!');

Returns the ciphertext of the provided plaintext. 

=item I<$OBJ>->decrypt(I<ARRAY>)

  my $plainText  = $cipher->decrypt($cipherText);

Returns the plaintext of the provided ciphertext. Note that because
encrypting and decrypting using Rot47 are exactly the same operation,
you could technically just call encrypt() to decrypt the ciphertext,
but I provided both methods to be consistent with the API of other
Crypt:: modules.

=back

=head2 Exportable Subroutines

=over 4

=item rot47(I<SCALAR>)

  use Crypt::Rot47 qw(rot47);

  my $cipherText = rot47('Hello, world!'); 
  my $plainText = rot47($cipherText);

Encrypts or decrypts the provided text. For Rot47, encryption and decryption
are the same operation, so calling rot47 on text twice has no effect.

=back

=head1 SEE ALSO

Crypt::Rot13 - A similar module that applies the Rot13 substitution cipher to text.

Crypt::Blowfish
Crypt::IDEA

=head1 AUTHOR

Zachary Blair, E<lt>zack_blair@hotmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Zachary Blair

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
