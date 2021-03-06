/*
 * SonarQube
 * Copyright (C) 2009-2018 SonarSource SA
 * mailto:info AT sonarsource DOT com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import * as React from 'react';
import { shallow } from 'enzyme';
import { createStore } from 'redux';
import { withCurrentUser } from '../withCurrentUser';
import { CurrentUser } from '../../../../app/types';

class X extends React.Component<{ currentUser: CurrentUser }> {
  render() {
    return <div />;
  }
}

const UnderTest = withCurrentUser(X);

it('should pass logged in user', () => {
  const currentUser = { isLoggedIn: false };
  const store = createStore(state => state, { users: { currentUser } });
  const wrapper = shallow(<UnderTest />, { context: { store } });
  expect(wrapper.dive().type()).toBe(X);
  expect(wrapper.dive().prop('currentUser')).toBe(currentUser);
});
