class Agx < Formula
  version "1.22.30"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.30/agx-1.22.30-darwin-arm64.tar.gz"
      sha256 "6cdbe78391fa5303ebd6aefafa2192238c8d0e8b88e917cb11515880d3a4157b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.30/agx-1.22.30-darwin-x64.tar.gz"
      sha256 "d1a03d274610e2a023183a996bbd56946ffe0bc8345f8da39e6c245980eec517"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.30/agx-1.22.30-linux-arm64.tar.gz"
      sha256 "87560ce5688fbc35798c3cc38d509bfe3456af766c4f09ad523d2e9944cd61ae"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.30/agx-1.22.30-linux-x64.tar.gz"
      sha256 "56670b334c076a31cccc04b68b49f5f99b56bb76700638785afcf3fb3578e330"
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
