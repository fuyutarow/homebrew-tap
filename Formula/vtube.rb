class Vtube < Formula
  desc "music bot CLI like Rythm(Discord bot)"
  homepage "https://github.com/fuyutarow/vtube"
  url "https://github.com/fuyutarow/vtube/archive/2019.09.11.tar.gz"

  depends_on "youtube-dl"
  depends_on "mplayer"

  def install
    bin.install "bin/vtube"
  end
end
