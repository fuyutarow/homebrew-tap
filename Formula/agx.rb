class Agx < Formula
  version "11.1.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.2/agx-11.1.2-darwin-arm64.tar.gz"
      sha256 "815b43eba52043f868eca93cd01388b9230f81f97da9604f32ca66519b7c9e82"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.2/agx-11.1.2-darwin-x64.tar.gz"
      sha256 "48b0c37d9bcf61715727ab0e030f3d4feea0a65abebfb6ad51d47976b6c07c88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.2/agx-11.1.2-linux-arm64.tar.gz"
      sha256 "21b7b574cd3a0df454c2042c092e0bbeb74f5892f232fb4d1fabb4fea99f2787"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.2/agx-11.1.2-linux-x64.tar.gz"
      sha256 "1312f765fb3b1b1b3b526f33aa89be840d1792a86a49781214979e9661a9e6d8"
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
