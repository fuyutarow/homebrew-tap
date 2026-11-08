class Agx < Formula
  version "5.8.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.0/agx-5.8.0-darwin-arm64.tar.gz"
      sha256 "edc7b38d01475b68ff246161ec53d681c8960cf19694ab55d1db93db640242b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.0/agx-5.8.0-darwin-x64.tar.gz"
      sha256 "27c02a4cabbda2aa2fbd91ebac8a6dd2492838b75f7c0fb52809612e72835787"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.0/agx-5.8.0-linux-arm64.tar.gz"
      sha256 "1f644710ee1ea6f1a479fb1ed1fecd4c796fe926ac67b35b28cbfbdf214d9811"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.0/agx-5.8.0-linux-x64.tar.gz"
      sha256 "764ea0b963b8e902711d6684f6929511cca4f6fe7f19a1979d3ada491e45a781"
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
