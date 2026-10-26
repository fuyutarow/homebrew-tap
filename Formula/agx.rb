class Agx < Formula
  version "1.16.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.0/agx-1.16.0-darwin-arm64.tar.gz"
      sha256 "cb2a3336915d0a609cc58c7c0384b1f1df4a7e006ef74c202cbb33cd19d40527"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.0/agx-1.16.0-darwin-x64.tar.gz"
      sha256 "fe3af4f2f20734a96e18d5cb7838cb578e2d1d51c790042d0880bfe8e7a996b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.0/agx-1.16.0-linux-arm64.tar.gz"
      sha256 "ae4f8a12d0c3004bb2101ea62bbe1692dbcc92d364124b874f8e87cac3901a47"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.0/agx-1.16.0-linux-x64.tar.gz"
      sha256 "8270dcf33c948151c84b8527533a711c51549e8a0477f0cc722f14ed992800b3"
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
