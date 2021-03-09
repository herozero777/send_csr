defmodule SendCsr do
  @moduledoc """
  Documentation for `SendCsr`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SendCsr.hello()
      :world

  """
  def hello do
    :world
  end

  def send_csr() do
    url = "http://localhost:9000/hi"
    HTTPoison.get(url)
  end

  def send_csr_post() do
    headers = [{"Content-type", "application/json"}]
    url = "http://localhost:9000/csr/sign"
    csr = "-----BEGIN CERTIFICATE REQUEST-----\nMIIBFDCBuwIBADBZMQswCQYDVQQGEwJVUzELMAkGA1UECAwCQ0ExFjAUBgNVBAcM\nDVNhbiBGcmFuY2lzY28xDTALBgNVBAoMBEFjbWUxFjAUBgNVBAMMDUVDRFNBIFJv\nb3QgQ0EwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAASIjf6ynrzpfJOJRxeVuyc+\n5BtVjGOTVk/NvP5Fz3OM+HUxJ4exzLD3Md649KUBZ6acaa0EAh4rk/l96qPPZljY\noAAwCgYIKoZIzj0EAwIDSAAwRQIgEc9/iLAI6f8/yOLMO64E+r18mtZG68rTm97q\nm+Ln+wACIQDSjg8irXuVipA6SX+pSJdbNsuWCpZB1rI6ECRfyh2bjw==\n-----END CERTIFICATE REQUEST-----\n\n\n"
    body = Poison.encode!( %{"csr_str": csr} )
    HTTPoison.post(url, body, headers)
  end

  def send_handle_post() do
    url = "http://localhost:9000/csr/handle"
    HTTPoison.post(url, "The post body")
  end

end
