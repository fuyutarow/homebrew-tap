class Agx < Formula
  version "1.22.22"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.22/agx-1.22.22-darwin-arm64.tar.gz"
      sha256 "91c538fcea922366ce4e569c2cb7e097c988cbb94dddb7c9725028b998a97fd1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.22/agx-1.22.22-darwin-x64.tar.gz"
      sha256 "90096ff55328b00273e6ac8fd680b4eab39d6eba7eca4de96b3de04028294d47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.22/agx-1.22.22-linux-arm64.tar.gz"
      sha256 "648be0f420db4c605cde9965c9782363edc116bf35f8a774e5fc0f1b1e37023c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.22/agx-1.22.22-linux-x64.tar.gz"
      sha256 "d56dca868ba2b2cfe55c7bb0a0aa3be7d39ffd22e95049e6ba7df48c3dfde114"
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
