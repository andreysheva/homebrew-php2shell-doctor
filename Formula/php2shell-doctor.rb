class Php2shellDoctor < Formula
  desc "Safe checker for the php2shell PHP RCEs (CVE-2026-109618/109619)"
  homepage "https://github.com/andreysheva/php2shell-doctor"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andreysheva/php2shell-doctor/releases/download/v#{version}/php2shell-doctor-darwin-arm64"
      sha256 "869b10859fdfcb39109a71351125811971e7c63024afd1a4e3e4bca95e120e00"
    else
      url "https://github.com/andreysheva/php2shell-doctor/releases/download/v#{version}/php2shell-doctor-darwin-amd64"
      sha256 "ebb14e4c6322327a01d549433ee13db569e6cfc04b319b55f40a7569e1075782"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/andreysheva/php2shell-doctor/releases/download/v#{version}/php2shell-doctor-linux-amd64"
      sha256 "85b92055c6b994992f30cbbeb562e41b7eab5dac5406ed25eba7af62f5d0460a"
    else
      url "https://github.com/andreysheva/php2shell-doctor/releases/download/v#{version}/php2shell-doctor-linux-arm64"
      sha256 "cadb42dae88d598c0ecfaab2b63f6f2b09a3d92ef5721607903a1ba83d355453"
    end
  end

  def install
    bin.install "php2shell-doctor"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/php2shell-doctor version")
  end
end
