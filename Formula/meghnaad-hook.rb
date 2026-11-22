class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-hook-0.8.46-aarch64-apple-darwin.tar.gz"
      sha256 "111f4fb9cf079404dde7822e251dd950db81dafeb23e47c070f60cad53775146"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-hook-0.8.46-x86_64-apple-darwin.tar.gz"
      sha256 "1ca7227f5097705e2928c3c686eb44e94809740145fd23ba7008d93887bd83bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-hook-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0b498974d0b533a69292b1485973ecf8d827742f463d0dba978cab8e55f90ca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-hook-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81fb1bff2e1c912050876289dfad019cb4fc5052691440837e39f471651c07ac"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.46/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
