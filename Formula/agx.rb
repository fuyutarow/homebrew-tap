class Agx < Formula
  version "1.22.33"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.33/agx-1.22.33-darwin-arm64.tar.gz"
      sha256 "9c89766c9120ae6aae9942d86f4eab157aafa61956dc102f2f4aa8465e288933"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.33/agx-1.22.33-darwin-x64.tar.gz"
      sha256 "10f2fbb1339db702060cf81610210eed435718f8d5d8dc56eb8bcf88404da58d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.33/agx-1.22.33-linux-arm64.tar.gz"
      sha256 "c1ac625dae15cbc21250de2cf04c04ae2f7d4256f036c8cc2cd3c771af2de0fe"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.33/agx-1.22.33-linux-x64.tar.gz"
      sha256 "5007e41ac2eaaa1e4d25adf0ffb3883983f8125ec1c47458bebe914ae4e03503"
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
