const std = @import("std");
const input = @import("input.zig");
const eql = std.mem.eql;

const menu_string: []const u8 = "--- Todo-List ---\n1 - Show todos\n2 - Complete todo\n3 - Create todo\n4 - Exit\nEnter number: ";

pub fn main() !void {
    try inputLoop();
}

pub fn inputLoop() !void {
    const stdout = std.io.getStdOut().writer();
    const allocator = std.heap.page_allocator;
    while (true) {
        try stdout.writeAll(menu_string);
        const input_value = std.mem.trim(u8, input.readNextLineBufferd(allocator, 16) catch |err| {
            if (err == error.BufferOverflow) {
                try stdout.writeAll("Input to long\n");
                continue;
            }
            return err;
        }, "\r\n");
        defer allocator.free(input_value);

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
