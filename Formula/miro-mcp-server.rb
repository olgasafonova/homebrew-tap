# Homebrew Formula for Miro MCP Server
# Usage: brew tap olgasafonova/tap && brew install miro-mcp-server

class MiroMcpServer < Formula
  desc "Model Context Protocol (MCP) server for Miro whiteboard integration"
  homepage "https://github.com/olgasafonova/miro-mcp-server"
  version "1.14.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.2/miro-mcp-server-darwin-amd64"
      sha256 "83351c25e940fc82c5d7faa5705f21524ea13a520f4bd8da45ecfd701d7c771b"

      def install
        bin.install "miro-mcp-server-darwin-amd64" => "miro-mcp-server"
      end
    end

    on_arm do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.2/miro-mcp-server-darwin-arm64"
      sha256 "a609f63a77cee0de7b4631a95b86e88a557fe88a73f9bc9af57318a55c6e8eca"

      def install
        bin.install "miro-mcp-server-darwin-arm64" => "miro-mcp-server"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.14.2/miro-mcp-server-linux-amd64"
      sha256 "0e28e7f0cf48bd4b8e2f3c8b4cceeae01e4333f5f43184320c446b0c2bcf3bc2"

      def install
        bin.install "miro-mcp-server-linux-amd64" => "miro-mcp-server"
      end
    end
  end

  def caveats
    <<~EOS
      Miro MCP Server has been installed!

      To use it, you need a Miro access token:

      1. Get a token from: https://miro.com/app/settings/user-profile/apps

      2. Configure Claude Code:
         claude mcp add miro-mcp-server -- miro-mcp-server

      3. Set the token as environment variable:
         export MIRO_ACCESS_TOKEN="your_token_here"

      For more information, see:
        https://github.com/olgasafonova/miro-mcp-server#readme
    EOS
  end

  test do
    assert_match "miro-mcp-server", shell_output("#{bin}/miro-mcp-server --version 2>&1", 1)
  end
end
