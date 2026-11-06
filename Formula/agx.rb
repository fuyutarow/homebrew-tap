class Agx < Formula
  version "1.23.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.2/agx-1.23.2-darwin-arm64.tar.gz"
      sha256 "3b720b0b340cb9502c84edac07c46fe1aab193d1474c89e1b89965fe637ac488"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.2/agx-1.23.2-darwin-x64.tar.gz"
      sha256 "32088e6036636d881ea34bd628cc6202796d6900907754c8fe33353ccb85e5be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.2/agx-1.23.2-linux-arm64.tar.gz"
      sha256 "ed1a9cd4199d63a2918852d83d5e38b824248b2b120df762d56d92f255c86b73"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.2/agx-1.23.2-linux-x64.tar.gz"
      sha256 "e6567cbccee75b91e20de74ecc99f2183b43ceddc645bae0ad3336357978e583"
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
