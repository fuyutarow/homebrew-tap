class Agx < Formula
  version "1.14.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.3/agx-1.14.3-darwin-arm64.tar.gz"
      sha256 "1df10743c4fdea08d49df5a3c7d0b3a2de23c651dae9285e78b8374b4cd21a12"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.3/agx-1.14.3-darwin-x64.tar.gz"
      sha256 "ce01d2342c00747074fa9323a7cf1a998f334b754f3e7b276b383831d9f27565"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.3/agx-1.14.3-linux-arm64.tar.gz"
      sha256 "8249f1e50c6a36fb7716441f89f7f6392f995c86d8d8c7960c21c8ceaf758141"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.3/agx-1.14.3-linux-x64.tar.gz"
      sha256 "79019837f0d3547f3ca22d9b32ca398c8d3341070029936f6decfbe854ca9910"
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
