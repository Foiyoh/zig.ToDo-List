const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const stdout = std.io.getStdOut().writer();
    const cin = std.io.getStdIn().reader();

    // Dynamischer Puffer für die Eingabe
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit(); // Speicher freigeben

    // Eingabeaufforderung
    try stdout.writeAll("Gib etwas ein (Beenden mit Enter): ");

    // Zeichenweise lesen bis zum Zeilenumbruch
    while (true) {
        const byte = try cin.readByte();
        if (byte == '\n') break; // Beende die Schleife bei Zeilenumbruch
        try list.append(byte); // Füge das Zeichen zum Puffer hinzu
    }

    // Ausgabe der gesamten Eingabe
    std.debug.print("Du hast eingegeben: {s}\n", .{list.items});
}
