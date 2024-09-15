# typed: true
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Imagick Extension
class ImagickAT70 < AbstractPhpExtension
  init
  desc "Imagick PHP extension"
  homepage "https://github.com/Imagick/imagick"
  url "https://pecl.php.net/get/imagick-3.7.0.tgz"
  sha256 "5a364354109029d224bcbb2e82e15b248be9b641227f45e63425c06531792d3e"
  head "https://github.com/Imagick/imagick.git"
  license "PHP-3.01"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 5
    sha256 cellar: :any,                 arm64_sequoia:  "b906a17d19a0e0bff44df293621a1726b0f2c4d1fa644d2f1abc8f48b1c259d5"
    sha256 cellar: :any,                 arm64_ventura:  "2b6e8e52e6b35a797c78bd1b2057e8098c1fd3535046998897d39955e79e6bb5"
    sha256 cellar: :any,                 arm64_monterey: "5b5ce5d8ac69604f95c450288e1c489ba6953c259cb41f67016b3d239071e306"
    sha256 cellar: :any,                 arm64_big_sur:  "ee1d545690378ccf2b55b06f596182066d79cb0d507a695b79a7b785cb13c657"
    sha256 cellar: :any,                 ventura:        "93309c56107859e9343f570539825c5a677baf4037ec78ce1678cc6219e30835"
    sha256 cellar: :any,                 monterey:       "f945056f955bef1b1d5beb095a4d8d4506e432df722066cc5c9573edba28b522"
    sha256 cellar: :any,                 big_sur:        "1c0ce67545a3a2533e1f2cb5fea2e18f934ca9d67cd72460df191f8ae3ddd566"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0eadf2ac38ec3e90b43b9c0cbb1635b37af84033de41ae627a7411c442b536d8"
  end

  depends_on "imagemagick"

  def install
    Dir.chdir "imagick-#{version}"
    safe_phpize
    system "./configure"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end
end
