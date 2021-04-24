class LineParser < Formula
  desc "A parser for LINE chat .txt file"
  homepage "https://github.com/fuyutarow/line-parser"
  url "https://github.com/fuyutarow/line-parser/archive/2019.11.09.tar.gz"
  sha256 "a7bb4213c1120ef57fc42705a390cb38b90a6525be289c94c132afc573331f1e"

  def install
    bin.install "target/release/line-parser"
  end

end
