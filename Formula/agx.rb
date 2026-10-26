class Agx < Formula
  version "1.13.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.2/agx-1.13.2-darwin-arm64.tar.gz"
      sha256 "2d513dccee87e27b9528d84b0189e87eaaa5609d8fc554f7e63daca023d7f105"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.2/agx-1.13.2-darwin-x64.tar.gz"
      sha256 "b38f544bb23f31bf84776e43ce1afa88b67c82e04c40a6a94c74cd3e64628939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.2/agx-1.13.2-linux-arm64.tar.gz"
      sha256 "967ea1500e31e133cbdb7575388fda9ec9e5fe279b122d97de8708d2a58d609a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.2/agx-1.13.2-linux-x64.tar.gz"
      sha256 "da5c24137f774d2ef2348ec0ecc8a729d5e9dc6a12a47a8cf841e8e2452e16d7"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
