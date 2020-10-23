open Unix

let serve (_: in_channel) out =
  output_string
    out
    "HTTP/1.0 200 OK\nContent-Type: text/plain; charset=utf-8\nContent-Length: 14\n\nHello, world!\n"

let () =
  let port =
    int_of_string Sys.argv.(1)
  in
    establish_server
      serve
      (ADDR_INET (inet_addr_of_string "0.0.0.0", port))
