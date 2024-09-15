# typed: true
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Amqp Extension
class AmqpAT56 < AbstractPhpExtension
  init
  desc "Amqp PHP extension"
  homepage "https://github.com/php-amqp/php-amqp"
  url "https://pecl.php.net/get/amqp-1.11.0.tgz"
  sha256 "dc5212b4785f59955118a219bbfbcedb7aa6ab2a91e8038a0ad1898f331c2f08"
  head "https://github.com/php-amqp/php-amqp"
  license "PHP-3.01"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any,                 arm64_sequoia:  "1bb5c05a48193a774a347e0a5caaf9f670ff9ba432314feb142e4a1440402b48"
    sha256 cellar: :any,                 arm64_ventura:  "00304687e0cdab34ecb498add8f54c169fab29263da08a06341eff0ff6aca26b"
    sha256 cellar: :any,                 arm64_monterey: "d914fea80914691daa2c21dc124a8b442852874ccee40adc5d4d5ebe7c6b9d28"
    sha256 cellar: :any,                 arm64_big_sur:  "b55eb4f418c36ccc2fdd94ed9b9c3357d3d7f73a1d0cc3588f3caa2483b0072b"
    sha256 cellar: :any,                 ventura:        "b7f194c46dff1e4ecd0cca621933e75846d0d1e0e3d9071f2d06bafee21cfff7"
    sha256 cellar: :any,                 big_sur:        "b232f615de8018b01452aad173b5ec7061cffb099ec1703fe51028aa904bfcb2"
    sha256 cellar: :any,                 catalina:       "7f3735ebdbb79797ca22a94c5feb31f76b7309eadaaa9dbe9b6e07f6d56a3339"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "89142052df1674e146c5e650d7459e71804e160c143477d8dbb57e776d1fcdbe"
  end

  depends_on "rabbitmq-c"

  def install
    args = %W[
      --with-amqp=shared
      --with-librabbitmq-dir=#{Formula["rabbitmq-c"].opt_prefix}
    ]
    Dir.chdir "amqp-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, *args
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end
end
