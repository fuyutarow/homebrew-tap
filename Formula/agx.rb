class Agx < Formula
  version "1.13.11"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.11/agx-1.13.11-darwin-arm64.tar.gz"
      sha256 "55659e884e0042377c855030991ab6fa2d05d6689f9336f6ce6bc591032381c3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.11/agx-1.13.11-darwin-x64.tar.gz"
      sha256 "3724c13c1db3dab65b49efcb2cb7f39ac3495110b94f2d327075cd37422f630d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.11/agx-1.13.11-linux-arm64.tar.gz"
      sha256 "4a4762f8e0da6bb334efbf5aa0c3b3d79e937dad93b0cedcb151adbc06d572da"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.11/agx-1.13.11-linux-x64.tar.gz"
      sha256 "0eac2eba0158dee396a158307cf73e6be7ecc7de543ba2bdbf15d9f9acf1d336"
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
