class Direwolf < Formula
  desc "Software “soundcard” AX.25 packet modem/TNC and APRS encoder/decoder"
  homepage "https://github.com/wb2osz/direwolf"
  url "https://github.com/wb2osz/direwolf/archive/refs/tags/1.6.tar.gz"
  sha256 "208b0563c9b339cbeb0e1feb52dc18ae38295c40c0009d6381fc4acb68fdf660"
  license "GPL-2.0-only"

  depends_on "cmake" => :build
  depends_on "portaudio"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args

    cd "build" do
      system "make", "-j4"
      system "make", "install"
      system "make", "install-conf"
    end
  end

  test do
    assert_match "Dire Wolf version 1.6", shell_output("#{bin}/direwolf -u")
  end
end
