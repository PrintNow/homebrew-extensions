# typed: true
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Ast Extension
class AstAT80 < AbstractPhpExtension
  init
  desc "Ast PHP extension"
  homepage "https://github.com/nikic/php-ast"
  url "https://pecl.php.net/get/ast-1.1.2.tgz"
  sha256 "8742427ff7c07ba93f940968f7363972ea040d97d847da3b79b4283c2a369dea"
  head "https://github.com/nikic/php-ast.git"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5e7246c70e1fc0dec8b03f45a270c0aee37ab8a19ebf791b8dbc7e527399f3c1"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "3ed15424d56907724ddb5b04190af27f0942d6eb7d6815cdb61e20980f462aff"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "97398a86bf9c531d11a88c5aa3d6c28000addd5e5cf704d669e543806eb105ad"
    sha256 cellar: :any_skip_relocation, ventura:        "af661e705e2190638e93f04fc6018c53a175fed9173eb45434bc77d88fedf3ac"
    sha256 cellar: :any_skip_relocation, monterey:       "a96405d0c126b97d5018d2fc52298cad3b5f75f51bda35e1e9153df915fe00aa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0751d79fdfb97c7fa44e59641c0dd52e83712de6f0a6dd18efb82761a0d8655a"
  end

  def install
    Dir.chdir "ast-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-ast"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
    add_include_files
  end
end
