# vim:fileencoding=utf-8:noet
from __future__ import (unicode_literals, division, absolute_import, print_function)

from powerline.segments.common.bat import _get_battery_status


def _battery_icon(capacity, icons):
	index = min(int(capacity // 25), len(icons) - 1)
	return icons[index]


def battery(pl, icons=('', '', '', '', ''), online=' ', offline='', format='{ac_state}{icon} {capacity:.0%}'):
	'''Return a Nerd Font battery icon with percentage for tmux.'''
	try:
		capacity, ac_powered = _get_battery_status(pl)
	except NotImplementedError:
		pl.info('Unable to get battery status.')
		return None

	icon = _battery_icon(capacity, icons)
	return format.format(
		icon=icon,
		ac_state=(online if ac_powered else offline),
		capacity=(capacity / 100.0),
	)
