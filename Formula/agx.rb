class Agx < Formula
  version "1.23.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.1/agx-1.23.1-darwin-arm64.tar.gz"
      sha256 "dbd1339bd281d8176684dfe1d71a2412b48677261c9030e5cba09b9e0f99a4d1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.1/agx-1.23.1-darwin-x64.tar.gz"
      sha256 "d11437bb4651b2e74d51656b684eb37ac4fa4615468f1a7c94931a5bfbd4b80e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.1/agx-1.23.1-linux-arm64.tar.gz"
      sha256 "354c4a4cc513d369d2bfe7539977bb5de6e37080efe1f26390d864d40aa92c86"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.23.1/agx-1.23.1-linux-x64.tar.gz"
      sha256 "21343ea2714767c7f6eb759cd0de391de8f386b27f305a7f8c3c5a0fd9ca746f"
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
