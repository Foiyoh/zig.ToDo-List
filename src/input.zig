const std = @import("std");

const InputError = error{
    BufferOverflow,
    InvalidInput,
};

pub fn readNextLine(allocator: std.mem.Allocator) ![]u8 {
    const cin = std.io.getStdIn().reader();

    var input_string = std.ArrayList(u8).init(allocator);
    errdefer input_string.deinit();

    while (true) {
        const next_char: u8 = try cin.readByte();
        if (next_char == '\n') break;
        try input_string.append(next_char);
    }
    return input_string.toOwnedSlice();
}

pub fn readNextLineBufferd(allocator: std.mem.Allocator, buffer_size: usize) ![]u8 {
    const stdin = std.io.getStdIn().reader();
    const input_buffer: []u8 = try allocator.alloc(u8, buffer_size);
    errdefer allocator.free(input_buffer);

    const input_string: ?[]u8 = stdin.readUntilDelimiterOrEof(input_buffer, '\n') catch |err| {
        if (err == error.StreamTooLong) {
            try stdin.skipUntilDelimiterOrEof('\n');
            return error.BufferOverflow;
        }
        return err;
    };

    return input_string orelse error.InvalidInput;
}
