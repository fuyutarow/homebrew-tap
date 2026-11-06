class Agx < Formula
  version "2.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.0/agx-2.0.0-darwin-arm64.tar.gz"
      sha256 "31ffd5e2a2967657502cc9b025d61b0ba881927a30e5ed612c32c4c820c0730b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.0/agx-2.0.0-darwin-x64.tar.gz"
      sha256 "24ce4407c3ab2660ea33a3b127b2307b2c9388451b236cf24cfdb7615119a881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.0/agx-2.0.0-linux-arm64.tar.gz"
      sha256 "d7bb00b19bf3445896d0d9f2b85b8c9caff4596d49eec638e6eade453d550ff1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v2.0.0/agx-2.0.0-linux-x64.tar.gz"
      sha256 "4f9a644b55031fda2d49cf6b46fa850b15500dbfacfe2a8c93b087718192237a"
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
