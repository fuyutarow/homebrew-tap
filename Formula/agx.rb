class Agx < Formula
  version "1.22.68"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.68/agx-1.22.68-darwin-arm64.tar.gz"
      sha256 "b696c600efbd4062089896b125fdea6ecc8c53a7583e77c454c968d3501f60c0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.68/agx-1.22.68-darwin-x64.tar.gz"
      sha256 "424476c55e8746afc859a5c561cea59916db30d03e2819651e6680fc38d098f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.68/agx-1.22.68-linux-arm64.tar.gz"
      sha256 "98706cef257094b548501e7549eff90b38ff348cf55743b92a7fab8bc685729f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.68/agx-1.22.68-linux-x64.tar.gz"
      sha256 "9711c893012bb306b8547225a6d6f17565b423eeb3c76bc55a78b7e5f84a2e89"
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
