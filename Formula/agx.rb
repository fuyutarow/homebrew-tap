class Agx < Formula
  version "1.17.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.0/agx-1.17.0-darwin-arm64.tar.gz"
      sha256 "083fecca2fa016848cb7a9c4ccb66c2a0c91a9f8d9f5c283b710f869715b5bf8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.0/agx-1.17.0-darwin-x64.tar.gz"
      sha256 "97348c65b822d70d41ceea98df1cd3d009b214fe5f1c26243a2cd043e3c734fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.0/agx-1.17.0-linux-arm64.tar.gz"
      sha256 "7598852ef079a300e1b1e5477e918202d542d5574ba3000b7c2c7bcd015773ec"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.0/agx-1.17.0-linux-x64.tar.gz"
      sha256 "71588eae91f8a1f5c99fb2a9904d5dc093b97550e934489ad113a301b7596401"
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
