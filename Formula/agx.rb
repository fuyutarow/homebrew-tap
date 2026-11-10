class Agx < Formula
  version "10.3.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.3.0/agx-10.3.0-darwin-arm64.tar.gz"
      sha256 "5d0c52eda2c4458af80e2fd9c61a364148d47d8675e70f7993719ae90f73ce4c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.3.0/agx-10.3.0-darwin-x64.tar.gz"
      sha256 "4955b81b8e67ac888c4384a09ab649a7b6f4f14f685671c65d6f454cc8a10305"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.3.0/agx-10.3.0-linux-arm64.tar.gz"
      sha256 "7a695e660b6ec275d237553b9f1a0b7bd0d6f319020d3b4900afd54c39c905ec"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.3.0/agx-10.3.0-linux-x64.tar.gz"
      sha256 "dd5e868e289de93488cd3262076ec33e2e9fd6a88b153674a01900b9f41c7d5d"
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
