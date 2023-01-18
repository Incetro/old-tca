//
//  FocusStateView.swift
//  verse-examples
//
//  Created by incetro on 16/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import TCA
import SwiftUI

// MARK: - FocusStateView

/// A visual representation of `FocusState` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<FocusStateState, FocusStateAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
@available(iOS 15.0, *)
public struct FocusStateView: View {

    // MARK: - Properties

    /// Focus state for text editors
    @FocusState var focusedField: FocusStateState.Field?

    /// `FocusState` module `Store` instance
    public let store: StoreOf<FocusStateFeature>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(
                    header: Text(template: Constants.summary)
                        .standard
                        .padding(.bottom, 24),
                    footer: Button {
                        viewStore.send(.actionButtonTapped)
                    } label: {
                        Text("Continue")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 13, style: .continuous)
                                    .fill(Color.accentColor)
                            )
                    }.disabled(!viewStore.isMandatorytDataFilled)
                ) {
                    TextField("Name", text: viewStore.binding(\.$name))
                        .focused($focusedField, equals: .name)
                        .frame(height: 36)
                    TextField("Surname", text: viewStore.binding(\.$surname))
                        .focused($focusedField, equals: .surname)
                        .frame(height: 36)
                    TextField("E-mail", text: viewStore.binding(\.$email))
                        .focused($focusedField, equals: .email)
                        .frame(height: 36)
                    HStack {
                        if viewStore.isPasswordShowed {
                            TextField("Password", text: viewStore.binding(\.$password))
                                .focused($focusedField, equals: .password)
                                .textContentType(.password)
                        } else {
                            SecureField("Password", text: viewStore.binding(\.$password))
                                .focused($focusedField, equals: .password)
                                .textContentType(.password)
                        }
                        if !viewStore.password.isEmpty {
                            Button {
                                viewStore.send(.togglePasswordButtonTapped)
                            } label: {
                                Image(systemName: viewStore.isPasswordShowed ? "eye.slash" : "eye")
                                    .foregroundColor(.accentColor)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .frame(height: 36)
                }.textCase(nil)
            }
            .navigationBarTitle("Focus state")
            .navigationBarItems(
                trailing: HStack {
                    Menu {
                        Button {
                            viewStore.send(.fillRandomDataButtonTapped)
                        } label: {
                            Label("Fill data", systemImage: "plus")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            )
            .alert(store.scope(state: \.alert), dismiss: .alertDismissed)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Next") {
                        viewStore.send(.nextButtonTapped)
                    }
                }
            }
            .synchronize(viewStore.binding(\.$field), $focusedField)
        }
    }
}

// MARK: - Constants

@available(iOS 15.0, *)
extension FocusStateView {

    enum Constants {

        static let summary = """
        This example demonstrates how to work with `@FocusState` logic in the VERSE.

        Here you have simple registration form. When you tap on any textfield focus state
        will be synchronized with SwiftUI's `@FocusState` variable. Moreover, you will have
        "Next" button above keyboard and will be able to jump to the next of existing textfields.
        When you tap on the "Next" button inside the last field, it will trigger an event of the action button below.
        """
    }
}

// MARK: - Synchronize

@available(iOS 15.0, *)
extension View {

    func synchronize<Value: Equatable>(_ first: Binding<Value>, _ second: FocusState<Value>.Binding) -> some View {
        self
            .onChange(of: first.wrappedValue) { second.wrappedValue = $0 }
            .onChange(of: second.wrappedValue) { first.wrappedValue = $0 }
    }
}
