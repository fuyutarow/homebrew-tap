class Agx < Formula
  version "1.23.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.0/agx-1.23.0-darwin-arm64.tar.gz"
      sha256 "3d61e177cddb96ad702f5f951c05ec74fbf63bb120c55a1252098efe5e4b5923"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.0/agx-1.23.0-darwin-x64.tar.gz"
      sha256 "3b79694107e94120c69e26cccc0160b1f10ef9dff161f957c5471ed0673258b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.0/agx-1.23.0-linux-arm64.tar.gz"
      sha256 "dc897202b21d5433ace0c50d93fa2cab0f7139935d39f5f350554396b617d219"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.0/agx-1.23.0-linux-x64.tar.gz"
      sha256 "97259bdb58652547abf2701bb9a477bf22a69b4af5780d74a21a10f4e804cbd9"
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
