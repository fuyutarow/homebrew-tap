class Agx < Formula
  version "6.0.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.1/agx-6.0.1-darwin-arm64.tar.gz"
      sha256 "a872f502b69ef19e127f8827e5eb38b56fe0b705b3203132e284f93e8fb39173"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.1/agx-6.0.1-darwin-x64.tar.gz"
      sha256 "43c4530da81046dd96b174a653403a5bb095823af4a0b2453aa8dd40b6ae0612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.1/agx-6.0.1-linux-arm64.tar.gz"
      sha256 "3bf7f38a750b2e89badc84161d255cfc3ea28a3d3a3c79f58916fb404b4dd325"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.1/agx-6.0.1-linux-x64.tar.gz"
      sha256 "73e8c69356e27bfcd17bdb507ca757a21b360e63f4409a5a2892e5ecde7ffb14"
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
