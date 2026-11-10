class Agx < Formula
  version "10.5.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.1/agx-10.5.1-darwin-arm64.tar.gz"
      sha256 "bd3cf4583bdb654cc29fd53e7449c58bc429228522c579b4159c4b19668028d1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.1/agx-10.5.1-darwin-x64.tar.gz"
      sha256 "0e1b26f836013cb966dcb665382caa4cb1978247b5e7259cf5ae7d7792ede7e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.1/agx-10.5.1-linux-arm64.tar.gz"
      sha256 "e6e3b9b51f0783225f29dac4aeaad099f47ae6b0c6b51cbca3074a11c1a9c6f9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.1/agx-10.5.1-linux-x64.tar.gz"
      sha256 "bac265736617039aec4d23667cfdffd5689c11aadbe172657947a167d3781c89"
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
