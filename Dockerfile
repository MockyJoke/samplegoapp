# Use the official Go image for building the application
FROM golang:1.20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go application source code to the working directory
COPY main.go .

# Build the Go application
RUN go build -o app .

# Use a minimal base image for the final container
FROM alpine:3.18

# Set the working directory in the final container
WORKDIR /app

# Copy the binary from the builder stage to the final container
COPY --from=builder /app/app .

# Expose the port the application will run on
EXPOSE 8080

# Command to run the application
CMD ["./app"]
