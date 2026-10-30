class Agx < Formula
  version "1.22.38"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.38/agx-1.22.38-darwin-arm64.tar.gz"
      sha256 "9409709695251015e4c1ed9b3fa425f9d5a0d496eada6d29bc1cc9b16aadbbcc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.38/agx-1.22.38-darwin-x64.tar.gz"
      sha256 "ab865a29fcb7fb0a26a9069f9f0b5bb5cc40d1f74075bc9e9700a17b12c92bde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.38/agx-1.22.38-linux-arm64.tar.gz"
      sha256 "8f91a0cf3a0b7acfd867dbcbeef75504b8490a46756356d4363c7f9e3046fc8a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.38/agx-1.22.38-linux-x64.tar.gz"
      sha256 "cef287eefd44c4a6d466d45f3514d0216ece4163009ff29b9e90b37ac18ce30d"
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
