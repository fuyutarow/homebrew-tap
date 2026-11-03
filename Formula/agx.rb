class Agx < Formula
  version "1.22.83"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.83/agx-1.22.83-darwin-arm64.tar.gz"
      sha256 "3ba0e2404356b3857f416d2a5a1c28625754d34ff386d12071f1daa7962affa4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.83/agx-1.22.83-darwin-x64.tar.gz"
      sha256 "aded1bc9ba4b76e5b50794555c7c0cbc07db247ae02bfcb3c3693fa0b57706c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.83/agx-1.22.83-linux-arm64.tar.gz"
      sha256 "598985fa108dad025729a395fbe7be5ff6c17cb949d675c8518a61fa693d76d8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.83/agx-1.22.83-linux-x64.tar.gz"
      sha256 "298afd5f0532c45b4726ee05af552c0783ba1dfe8ea703fca8ebd60c0807bd4a"
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
