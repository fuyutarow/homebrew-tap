class Agx < Formula
  version "6.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.0/agx-6.0.0-darwin-arm64.tar.gz"
      sha256 "16d41001a7d1d36b937ad079ee65a2fa102c80756c8e5030eaba19c90d0dc2f0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.0/agx-6.0.0-darwin-x64.tar.gz"
      sha256 "88051f9b4019fcf72ec7fa0e6694452250437a8d32396f20a8ffde3d3e286242"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.0/agx-6.0.0-linux-arm64.tar.gz"
      sha256 "c8e5625ffbeca2e019f7ca530a94f90b37f5e44202a095535d617779d82377dd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v6.0.0/agx-6.0.0-linux-x64.tar.gz"
      sha256 "b3a2c717d2494efefeb05befc667530c8122b5e2d4023d64e4b5aedeb14f7077"
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
