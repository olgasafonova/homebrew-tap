# Homebrew Formula for Miro MCP Server
# Usage: brew tap olgasafonova/tap && brew install miro-mcp-server

class MiroMcpServer < Formula
  desc "Model Context Protocol (MCP) server for Miro whiteboard integration"
  homepage "https://github.com/olgasafonova/miro-mcp-server"
  version "1.11.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.11.2/miro-mcp-server-darwin-amd64"
      sha256 "9d76680d580b16afe4808a725a624a23e542a3374eaf252081537664d7cc06ef"

      def install
        bin.install "miro-mcp-server-darwin-amd64" => "miro-mcp-server"
      end
    end

    on_arm do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.11.2/miro-mcp-server-darwin-arm64"
      sha256 "5529015d0014affd4d182a705da868b6f929258e0fdeb940625924310df1daed"

      def install
        bin.install "miro-mcp-server-darwin-arm64" => "miro-mcp-server"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.11.2/miro-mcp-server-linux-amd64"
      sha256 "c6d058827eac86c0074e6acef13347424513572da50a3c6bbefd68c0ca1eb357"

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
