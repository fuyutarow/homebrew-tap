class Agx < Formula
  version "5.6.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.6.0/agx-5.6.0-darwin-arm64.tar.gz"
      sha256 "6a015c56e598d8c9981b0c4cd990a4630ba6c0a40211cb9d4a1b1c64f6bbe4e6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.6.0/agx-5.6.0-darwin-x64.tar.gz"
      sha256 "e90392b1d4d8c85c5febd57b1b5dd6ae8f8a1623ba27aacff15523343447d004"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.6.0/agx-5.6.0-linux-arm64.tar.gz"
      sha256 "10abe9f9d9773ed6f8e6faec1f15190cadd8eb63b7a9782f2a9e45b28b72e2f1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.6.0/agx-5.6.0-linux-x64.tar.gz"
      sha256 "00f4d9d805d6f0def53f8528326a99a07bad3931d0a89d1c1b0217ec2e18cc49"
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
