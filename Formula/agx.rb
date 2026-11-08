class Agx < Formula
  version "10.0.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.1/agx-10.0.1-darwin-arm64.tar.gz"
      sha256 "c7790182f3ca5ea4f2d0f166ffd382088a95669714a1044601c30b72223046e5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.1/agx-10.0.1-darwin-x64.tar.gz"
      sha256 "ba44c217b1935bbc6426aad0598c281c8c4662600874cbc09f14fdb364d6d45b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.1/agx-10.0.1-linux-arm64.tar.gz"
      sha256 "b267f108419cbba63cee53651b5e6893855ded533accd7e64cde0db92e7c6a34"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.1/agx-10.0.1-linux-x64.tar.gz"
      sha256 "6d44426f2bbee652a4002fa3e18e215c63faa49c0dff60bdba333a9f8ac8e87f"
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
