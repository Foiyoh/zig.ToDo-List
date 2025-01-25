const std = @import("std");
const eql = std.mem.eql;

const menu_string: []const u8 = "--- Todo-List ---\n1 - Show todos\n2 - Complete todo\n3 - Create todo\n4 - Exit\nEnter number: ";

pub fn main() !void {
    try inputLoop();
}

pub fn inputLoop() !void {
    const stdout = std.io.getStdOut().writer();

    while (true) {
        try stdout.writeAll(menu_string);
        const input_value = std.mem.trim(u8, try readNextLine(), "\r\n");
        defer std.heap.page_allocator.free(input_value);

        if (eql(u8, input_value, "1")) {
            //TODO
        } else if (eql(u8, input_value, "2")) {
            //TODO
        } else if (eql(u8, input_value, "3")) {
            //TODO
        } else if (eql(u8, input_value, "4")) {
            try stdout.writeAll("Exit\n");
            break;
        } else {
            try stdout.writeAll("Invalid input\n");
        }
    }
}

pub fn readNextLine() ![]u8 {
    const allocator = std.heap.page_allocator;
    const cin = std.io.getStdIn().reader();

    var input_string = std.ArrayList(u8).init(allocator);
    defer input_string.deinit();

    while (true) {
        const next_char: u8 = try cin.readByte();
        if (next_char == '\n') break;
        try input_string.append(next_char);
    }
    return input_string.toOwnedSlice();
}
