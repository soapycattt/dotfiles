#!/bin/bash

# Ensure the script receives exactly one argument
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 {west|east|north|south}"
	exit 1
fi

direction=$1

current_window_id=$(yabai -m query --windows --window | jq -r .id)
current_space=$(yabai -m query --windows --window | jq -r .space)
current_x=$(yabai -m query --windows --window | jq -r .frame.x)
current_y=$(yabai -m query --windows --window | jq -r .frame.y)
current_width=$(yabai -m query --windows --window | jq -r .frame.w)
current_height=$(yabai -m query --windows --window | jq -r .frame.h)

current_y_south=$(echo "$current_y + $current_height" | bc)
current_x_east=$(echo "$current_x + $current_width" | bc)

find_west() {
	closest_west_window_id=$(
		yabai -m query --windows | jq -r --argjson current_window_id $current_window_id --argjson current_x $current_x --argjson current_space $current_space '[.[]
      | select(
          .id != $current_window_id and
          .frame.x < $current_x and
          .space == $current_space and
          ."is-visible" == true
        )]
      | min_by(.frame.x)
      | .id
    '
	)
	echo "$closest_west_window_id"
}

# Function to focus the closest window to the east
find_east() {
	closest_east_window_id=$(
		yabai -m query --windows | jq -r --argjson current_window_id $current_window_id --argjson current_x_east $current_x_east --argjson current_space $current_space '[.[]
      | select(
          .id != $current_window_id and
          (.frame.x + .frame.w) > $current_x_east and
          .space == $current_space and
          ."is-visible" == true
        )]
      | min_by(.frame.x)
      | .id
    '
	)
	echo "$closest_east_window_id"

}

# Function to focus the closest window above
find_north() {
	closest_north_window_id=$(
		yabai -m query --windows | jq -r --argjson current_window_id $current_window_id --argjson current_y $current_y --argjson current_space $current_space '[.[]
      | select(
          .id != $current_window_id and
          .frame.y < $current_y and
          .space == $current_space and
          ."is-visible" == true
        )]
      | min_by(.frame.x)
      | .id
    '
	)
	echo "$closest_north_window_id"
}

# Function to focus the closest window below
find_south() {
	closest_south_window_id=$(
		yabai -m query --windows | jq -r --argjson current_window_id $current_window_id --argjson current_y_south $current_y_south --argjson current_space $current_space '[.[]
      | select(
          .id != $current_window_id and
          (.frame.y + .frame.h) > $current_y_south and
          .space == $current_space and
          ."is-visible" == true
        )]
      | min_by(.frame.x)
      | .id
    '
	)
	echo "$closest_south_window_id"
}

# Call the appropriate function and capture the output
case "$direction" in
west)
	next_window_id=$(find_west "$current_window_id" "$current_x")
	;;
east)
	next_window_id=$(find_east "$current_window_id" "$current_x")
	;;
north)
	next_window_id=$(find_north "$current_window_id" "$current_y")
	;;
south)
	next_window_id=$(find_south "$current_window_id" "$current_y")
	;;
*)
	echo "Invalid direction. Use west, east, north, or south."
	exit 1
	;;
esac

# Focus the closest window if found
if [ -n "$next_window_id" ]; then
	yabai -m window --focus "$next_window_id" 2>/dev/null || echo "Failed to focus window with ID $next_window_id"
else
	echo "No valid window ID to focus."
fi
