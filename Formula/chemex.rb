class Chemex < Formula
  desc "NMR Chemical Exchange Analysis Tool"
  homepage "http://gbouvignies.github.io/ChemEx/"
  url "https://github.com/gbouvignies/ChemEx/archive/v2025.4.0.tar.gz"
  sha256 "e4fbb34349960ede2be6e6968dbd2770fe0a0c0c256a781f66f5a00980951f30"
  license "GPL-3.0-or-later"
  head "https://github.com/gbouvignies/ChemEx.git", branch: "main"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources using: "python@3.12"
  end

  test do
    system bin/"chemex", "--version"
    # Test basic functionality
    system bin/"chemex", "--help"
  end
end
