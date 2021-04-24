class Commad < Formula
  desc ",d: A modern version of `cd` from now on."
  homepage "https://github.com/fuyutarow/commad"
  url "https://github.com/fuyutarow/commad/archive/2019.09.07.tar.gz"
  sha256 "e24f23cc1a3f20e4dca61840caa9f2a2e3fd9ab21ba49ee887a9ea9d4acc09cd"

  def install
    bin.install "commadrc"
  end

end
