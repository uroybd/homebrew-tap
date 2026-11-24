class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-hook-0.8.57-aarch64-apple-darwin.tar.gz"
      sha256 "cef8c6b10a3369fe36497cb49a2cd8f08846a7fd14662bc6d8b35f7148625eb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-hook-0.8.57-x86_64-apple-darwin.tar.gz"
      sha256 "f16c754258a7ef02e605b5830404e9c77baa830bf99dc65e817cebc874282c1b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-hook-0.8.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18d7639259611daada225fb1067080d53daf3b695805e5a4c9a17813f6c95f23"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-hook-0.8.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbe36593436fd1bb5a07998a9204be8dcd663ea85fa3608452cc2bef87092318"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.57/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
