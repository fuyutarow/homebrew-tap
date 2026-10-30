class Agx < Formula
  version "1.22.45"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.45/agx-1.22.45-darwin-arm64.tar.gz"
      sha256 "e6e5c4195f07effb6f8782750c1f6746731b29ec4cb46b624c896dff9f7edb54"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.45/agx-1.22.45-darwin-x64.tar.gz"
      sha256 "c416afa4be128e9e7c24639c485242d7b809e5fba088efb4112fc38fe5aa31fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.45/agx-1.22.45-linux-arm64.tar.gz"
      sha256 "cdf87f6d9bf8218f0e070e019426ac76c21b8f7705a36f2c7bc0daac8efbda5e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.45/agx-1.22.45-linux-x64.tar.gz"
      sha256 "adab18aafdbaf5f6befea44e9ccd870a65b077e0f37ebd7c271de70b47169fbf"
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
