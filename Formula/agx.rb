class Agx < Formula
  version "1.18.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.3/agx-1.18.3-darwin-arm64.tar.gz"
      sha256 "ceb6669d6e8da376a5f289075c0dfb9baaac50db4e7a303f8d2f365a24be3bc2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.3/agx-1.18.3-darwin-x64.tar.gz"
      sha256 "0b44f0cae0c0e37cba4422b86f0e19bf5d59c920ab30ad42ee76350588ea8c3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.3/agx-1.18.3-linux-arm64.tar.gz"
      sha256 "64f5bc67620e4e1fa66c144577bfa3081fcfe8a8a0e2abd33b02eead8fed200e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.3/agx-1.18.3-linux-x64.tar.gz"
      sha256 "db03c456479d82af0535b159da0f1e8987414f74e6e8981b4cc841867014b9a9"
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
