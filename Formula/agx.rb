class Agx < Formula
  version "1.22.79"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.79/agx-1.22.79-darwin-arm64.tar.gz"
      sha256 "b17105459178cf7481593be8325a8e896c9f98f88ce15bccffd83d8f7589bd4f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.79/agx-1.22.79-darwin-x64.tar.gz"
      sha256 "5b5454f47f3fe631e5ef7dadd31772aaac0f4390b9aca8be7e0b004aaf379143"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.79/agx-1.22.79-linux-arm64.tar.gz"
      sha256 "5540f16edd0357f243feb26f5666612ffc8d0c1d5ccd29d8292421098fa21145"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.79/agx-1.22.79-linux-x64.tar.gz"
      sha256 "af962a204e9fb9e4c81b03f2b241d3162372fcd7609daeaed9c97841b96b0396"
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
