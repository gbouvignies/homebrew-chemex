class Chemex < Formula
  include Language::Python::Virtualenv

  desc "NMR Chemical Exchange Analysis Tool"
  homepage "http://gbouvignies.github.io/ChemEx/"
  url "https://github.com/gbouvignies/ChemEx/archive/v2025.4.0.tar.gz"
  sha256 "e4fbb34349960ede2be6e6968dbd2770fe0a0c0c256a781f66f5a00980951f30"
  license "GPL-3.0-or-later"
  head "https://github.com/gbouvignies/ChemEx.git", branch: "main"

  depends_on "python@3.12"

  def install
    # Create a virtualenv with pip
    venv = virtualenv_create(libexec, "python3.12", without_pip: false)
    # Install the package with all dependencies
    venv.pip_install buildpath
    # Link executable scripts
    bin.install_symlink venv.root/"bin/chemex"
  end

  test do
    system bin/"chemex", "--version"
    # Test basic functionality
    system bin/"chemex", "--help"
  end
end
